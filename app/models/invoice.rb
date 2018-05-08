class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :merchant
  # has_many   :invoice_items
  # has_many   :items, through: :invoice_items

  def self.update(invoice_id, update_parameters)
    invoice = Invoice.find(invoice_id)
    update_parameters[:updated_at] = Time.now
    invoice.update(update_parameters)
  end
end
