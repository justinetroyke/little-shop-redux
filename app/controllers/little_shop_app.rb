class LittleShopApp < Sinatra::Base

  get '/' do
    @merchants = Merchant.all

    erb :'merchant/index'
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :'merchant/index'
  end

  get '/' do
    @invoices = Invoice.all

    erb :'invoice/index'
  end

  get '/invoices' do
    @invoices = Invoice.all

    erb :'invoice/index'
  end
end
