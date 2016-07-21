// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular

var form = document.querySelector('#my-sample-form');
var submit = document.querySelector('input[type="submit"]');

braintree.client.create({
    authorization: 'sandbox_92dswc7q_mbmb637xwpzgxbrd'
}, function (err, clientInstance) {
    if (err) {
        console.error(err);
        return;
    }

    // Create input fields and add text styles
    braintree.hostedFields.create({
        client: clientInstance,
        styles: {
            'input': {
                'color': '#282c37',
                'font-size': '16px',
                'transition': 'color 0.1s',
                'line-height': '3'
            },
            // Style the text of an invalid input
            'input.invalid': {
                'color': '#E53A40'
            },
            // placeholder styles need to be individually adjusted
            '::-webkit-input-placeholder': {
                'color': 'rgba(0,0,0,0.6)'
            },
            ':-moz-placeholder': {
                'color': 'rgba(0,0,0,0.6)'
            },
            '::-moz-placeholder': {
                'color': 'rgba(0,0,0,0.6)'
            },
            ':-ms-input-placeholder ': {
                'color': 'rgba(0,0,0,0.6)'
            }

        },
        // Add information for individual fields
        fields: {
            number: {
                selector: '#card-number',
                placeholder: '1111 1111 1111 1111'
            },
            cvv: {
                selector: '#cvv',
                placeholder: '123'
            },
            expirationDate: {
                selector: '#expiration-date',
                placeholder: '10 / 2019'
            }
        }
    }, function (err, hostedFieldsInstance) {
        if (err) {
            console.error(err);
            return;
        }

        hostedFieldsInstance.on('validityChange', function (event) {
            // Check if all fields are valid, then show submit button
            var formValid = Object.keys(event.fields).every(function (key) {
                return event.fields[key].isValid;
            });

            if (formValid) {
                $('.pay-button').prop("disabled", false);
            } else {
                $('.pay-button').prop("disabled", true);
            }
        });

        hostedFieldsInstance.on('empty', function (event) {
            $('header').removeClass('header-slide');
            $('#card-image').removeClass();
            $(form).removeClass();
        });

        hostedFieldsInstance.on('cardTypeChange', function (event) {
            // Change card bg depending on card type
            if (event.cards.length === 1) {
                $(form).removeClass().addClass(event.cards[0].type);
                $('#card-image').removeClass().addClass(event.cards[0].type);
                $('header').addClass('header-slide');

                // Change the CVV length for AmericanExpress cards
                if (event.cards[0].code.size === 4) {
                    hostedFieldsInstance.setPlaceholder('cvv', '1234');
                }
            } else {
                hostedFieldsInstance.setPlaceholder('cvv', '123');
            }
        });

        submit.addEventListener('click', function (event) {
            event.preventDefault();

            hostedFieldsInstance.tokenize(function (err, payload) {
                if (err) {
                    console.error(err);
                    return;
                }

                // This is where you would submit payload.nonce to your server
                alert('Got a nonce: ' + payload.nonce);
                // If this was a real integration, this is where you would
                // send the nonce to your server.
                console.log('Got a nonce: ' + payload.nonce);
            });
        }, false);
    });
});