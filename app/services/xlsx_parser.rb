require 'roo'

class XlsxParser
  def initialize import
    @import = import
  end

  def call
    create_contact(upload_file) if upload_file
  end

  private

  def upload_file
    Roo::Spreadsheet.open(@import.attachment, extension: :xlsx).parse
  end

  def create_contact file
    file.drop(1).each do |contact|
      unless contact.all? {|x| x.nil?}
        data = {
          first_name: contact[0].capitalize.gsub(/[$^&%*@()!{}]+/, ''),
          last_name: contact[1].capitalize.gsub(/[$^&%*@()!{}]+/, ''),
          email: contact[2],
          import_id: @import.id
        }

        new_contact = Contact.new(data)
        
        if new_contact.save
          data[:validated] = true
        else
          data[:reason] = new_contact.errors.map {|k,v| "#{k} #{v}" }.join(", ")
        end
        
        ListContact.create(data)
      end
    end
  end
end


