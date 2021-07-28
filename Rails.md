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

## References

[http://www.davidverhasselt.com/set-attributes-in-activerecord/#cheat-sheet](http://www.davidverhasselt.com/set-attributes-in-activerecord/#cheat-sheet)
