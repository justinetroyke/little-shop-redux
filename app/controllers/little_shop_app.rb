class LittleShopApp < Sinatra::Base
  get '/' do
    erb :"homepage/index"
  end

  get '/merchants/new' do
    erb :'merchants/create'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params['id'])
    @items = @merchant.items

    erb :"merchants/individual_merchant"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params['id'])
    erb :"merchants/edit"
  end

  delete '/merchants/:id/delete' do
    merchant = Merchant.find(params['id'])
    Merchant.delete(merchant)
    redirect '/merchants'
  end

  post '/merchants' do
    params[:merchant] =
      merchant = Merchant.create(params['merchant'])

    redirect "/merchants/#{merchant.id}"
  end

  post '/merchant/:id' do
    merchant = Merchant.find(params['id'])
    merchant.update(params['merchant'])
    merchant.save
    redirect "/merchants/#{merchant.id}"
  end

  get '/merchants' do
    @merchants = Merchant.all.sort_by(&:name)

    erb :"merchants/index"
  end

  get '/invoices' do
    @invoices = Invoice.all

    erb :'invoices/index'
  end

  get'/invoices/:id' do
    @invoice = Invoice.find(params['id'])

    erb :'invoices/individual_invoice'
  end

  get '/items' do
    @items = Item.all

    erb :"item/index"
  end

  get '/items-dashboard' do
    @total_count_of_items = Item.all.length
    @average_price_per_item = Item.average_price
    @most_recently_created_item = Item.most_recently_created
    @oldest_item = Item.oldest_item

    erb :"item/dashboard"
  end

  get '/items/new' do
    @merchants = Merchant.all

    erb :"item/create_an_item"
  end

  post '/items/new' do
    item = Item.create(params[:item])

    redirect "/items/#{item.id}"
  end

  get '/items/dashboard' do

    erb :"item/dashboard"
  end

  get '/items/:id/edit' do
    @merchants = Merchant.all
    @item = Item.find(params[:id])
    @merchant = Merchant.find_by(id: @item.merchant_id)

    erb :"item/update_an_item"
  end

  post '/items/:id/edit' do
    Item.update(params[:id], params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/delete/:id' do
    Item.delete(params[:id])

    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @merchant = Merchant.find_by(id: @item.merchant_id)

    erb :"item/individual_item"
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    
    erb :"merchants/dashboard"
  end
  
end
