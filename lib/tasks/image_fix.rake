desc "Obfuscate filenames of old paperclip documents"
task obfuscate_legacy_documents: :environment do
  Attachment.find_in_batches do |attachments|
    attachments.each do |attachment|
      if attachment.document.original_filename
        legacy_filename = File.join(
            File.dirname(attachment.document.path),
            attachment.document.original_filename
        )

        if File.exist? legacy_filename
          File.rename(legacy_filename, attachment.document.path)
        end
      end
    end
  end
end