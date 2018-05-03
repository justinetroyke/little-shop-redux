class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all

    erb :'merchant/index'
  end

  get '/invoices' do
    @invoices = Invoice.all

    erb :'invoice/index'
  end
end
