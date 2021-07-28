# Rails

## Active Record

Update methods cheat sheet (for Rails 4):
- `update_attributes` = `assign_attributes` + `save`
- `attributes=` = alias of `assign_attributes`
- `update` = alias of `update_attributes`

## Controllers

```ruby
    image = File.open "public/done.png", "rb"
    respond_to do | format |
      format.html
      format.json
      format.png { send_data image.read, type: "image/png", disposition: "inline" }
    end
```

## Views

### Conditions

```erb
<% if @commentable == @user %>
  <%= semantic_form_for [@commentable, @comment] do |f| %>
  <% end %>
<% else %>
  <%= semantic_form_for [@user, @commentable, @comment] do |f| %>
  <% end %>
<% end %>
```

## Misc

### Data and DB

From rails console you may want to access raw data or data that are not instanciated into a model.  
You can run this in order to execute raw SQL:

```ruby
sql = "SELECT * FROM \"some_table\""
ActiveRecord::Base.connection.exec_query(sql)
```

You can then use `.entries` onto the `ActiveRecord::Result` to get a proper list of Hashes.

```ruby
sql = "SELECT * FROM \"some_table\""
ActiveRecord::Base.connection.exec_query(sql).entries
# Could return for example something like that:
[{"id"=>1,
  "creator_id"=>1,
  "name"=>"blazer queries",
  "description"=>"",
  "statement"=>"SELECT * FROM \"blazer_queries\"",
  "data_source"=>"main",
  "status"=>"active",
  "created_at"=>2021-07-28 16:51:23.961785 UTC,
  "updated_at"=>2021-07-28 16:51:23.961785 UTC}]
```

## References

[http://www.davidverhasselt.com/set-attributes-in-activerecord/#cheat-sheet](http://www.davidverhasselt.com/set-attributes-in-activerecord/#cheat-sheet)
