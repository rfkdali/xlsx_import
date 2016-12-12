class ListContactsController < ApplicationController
  def index
    @contacts = ListContact.all
  end
end