class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :merchant
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  def self.status_percent
    Invoice.group(:status).order('count_all').count
  end

  def self.high_unit_price
    Invoice.find(InvoiceItem.all.sort_by(&:unit_price).reverse.first.invoice_id)
  end

  def self.low_unit_price
    Invoice.find(InvoiceItem.all.sort_by(&:unit_price).first.invoice_id)
  end

  def self.high_qty
    Invoice.find(InvoiceItem.all.sort_by(&:quantity).reverse.first.invoice_id)
  end

  def self.low_qty
    Invoice.find(InvoiceItem.all.sort_by(&:quantity).first.invoice_id)
  end
end
