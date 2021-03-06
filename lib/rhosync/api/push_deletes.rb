Server.api :push_deletes do |params,user|
  source = Source.load(params[:source_id],{:app_id=>APP_NAME,:user_id=>params[:user_id]})
  source_sync = SourceSync.new(source)
  timeout = params[:timeout] || 10
  raise_on_expire = params[:raise_on_expire] || false
  rebuild_md = params[:rebuild_md].nil? ? true : params[:rebuild_md]
  source_sync.push_deletes(params[:objects],timeout,raise_on_expire,rebuild_md)
  'done'
end
