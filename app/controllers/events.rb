get '/create_event' do
  @user = User.find(session[:user_id].to_i)
  erb :create_event
end

post '/create_event' do
event = Event.create(params[:event])

  redirect '/'
end

get '/find_event' do
@events = Event.all
@user = User.find(session[:user_id].to_i)
erb :find_events
end

post '/find_event' do
p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  p params 
  EventAttendance.create(params[:event])
  redirect '/'
end

get '/edit_event/:event_id' do
  @user = User.find(session[:user_id].to_i)
  @event = Event.find(params[:event_id].to_i)
  erb :edit_event
end

post '/edit_event' do
  Event.update(params[:event][:id], params[:event])
redirect '/'
end

post '/delete_event' do
  @event = Event.find(params[:event][:id].to_i)
  @event.destroy
 redirect '/'
end
