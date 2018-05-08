class LittleShopApp < Sinatra::Base
  get '/' do
    erb :"homepage/index"
  end

  get '/merchants-dashboard' do
    @merchant_info = Merchant.merchant_info
    @highest_price_item = Merchant.merchant_with_highest_price_item
    @merchant_with_most_item = @merchant_info.sort_by(&:item_count).reverse.first
    erb :"merchants/dashboard"
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
    merchant = Merchant.new(params['merchant'])
    if merchant.save
      redirect "/merchants/#{merchant.id}"
    else
      redirect '/merchants/new'
    end
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

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params['id'])
    @merchants = Merchant.all

    erb :"invoices/edit"
  end

  delete '/invoices/delete/:id' do
    Invoice.destroy(params[:id])

    redirect '/invoices'
  end

  get'/invoices/:id' do
    @invoice = Invoice.find(params['id'])
    # @invoice_items = @invoice.invoice_items

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
    item = Item.new(params[:item])
    if item.save
      redirect "/items/#{item.id}"
    else
      redirect "/items/new"
    end
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
end
