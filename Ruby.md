```
#!/usr/bin/env ruby
class Microwave
  def on
    puts "Microwave is on"
  end
end

m = Microwave.new
m.on

class Microwave
  alias :old_on1 :on

  def on
    puts "Warning: Do not insert metal objects!"
    old_on1
  end
end

m.on # Message for this specific microwave

class <<m
  alias :old_on2 :on

  def on
    puts "This microwave is weak, add extra time"
    old_on2
  end
end

m.on # Displays extra message
m2 = Microwave.new
m2.on # Does not display extra message
```
[ref](http://ruby.about.com/od/rubyfeatures/a/aliasing.htm)