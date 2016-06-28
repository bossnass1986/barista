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

braintree.client.create({
    authorization: 'sandbox_g42y39zw_348pk9cgf3bgyw2b'
}, function (err, clientInstance) {
    if (err) {
        console.error(err);
        return;
    }

    braintree.hostedFields.create({
        client: clientInstance,
        styles: {
            'input': {
                'font-size': '16px',
                'font-family': 'roboto, verdana, sans-serif',
                'font-weight': 'lighter',
                'color': 'black'
            },
            ':focus': {
                'color': 'black'
            },
            '.valid': {
                'color': 'black'
            },
            '.invalid': {
                'color': 'black'
            }
        },
        fields: {
            number: {
                selector: '#card-number',
                placeholder: '1111 1111 1111 1111'
            },
            cvv: {
                selector: '#cvv',
                placeholder: '111'
            },
            expirationDate: {
                selector: '#expiration-date',
                placeholder: 'MM/YY'
            },
            postalCode: {
                selector: '#postal-code',
                placeholder: '11111'
            }
        }
    }, function (err, hostedFieldsInstance) {
        if (err) {
            console.error(err);
            return;
        }

        hostedFieldsInstance.on('focus', function (event) {
            var field = event.fields[event.emittedBy];

            $(field.container).next('.hosted-field--label').addClass('label-float').removeClass('filled');
        });

        // Emulates floating label pattern
        hostedFieldsInstance.on('blur', function (event) {
            var field = event.fields[event.emittedBy];

            if (field.isEmpty) {
                $(field.container).next('.hosted-field--label').removeClass('label-float');
            } else if (event.isValid) {
                $(field.container).next('.hosted-field--label').addClass('filled');
            } else {
                $(field.container).next('.hosted-field--label').addClass('invalid');
            }
        });

        hostedFieldsInstance.on('empty', function (event) {
            var field = event.fields[event.emittedBy];

            $(field.container).next('.hosted-field--label').removeClass('filled').removeClass('invalid');
        });

        hostedFieldsInstance.on('validityChange', function (event) {
            var field = event.fields[event.emittedBy];

            if (field.isPotentiallyValid) {
                $(field.container).next('.hosted-field--label').removeClass('invalid');
            } else {
                $(field.container).next('.hosted-field--label').addClass('invalid');
            }
        });

        $('#cardForm').submit(function (event) {
            event.preventDefault();

            hostedFieldsInstance.tokenize(function (err, payload) {
                if (err) {
                    console.error(err);
                    return;
                }

                // This is where you would submit payload.nonce to your server
                alert('Submit your nonce to your server here!');
            });
        });
    });
});