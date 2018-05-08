class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :merchant
  # has_many   :invoice_items
  # has_many   :items, through: :invoice_items
  def self.delete(invoice_id)
    invoice = Invoice.find(invoice_id)
    invoice.destroy
  end
end
