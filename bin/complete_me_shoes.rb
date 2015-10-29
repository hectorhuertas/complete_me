require_relative '../lib/complete_me'
Shoes.app {
  complete_me = CompleteMe.new
  dictionary = File.read('/usr/share/dict/words')
  complete_me.populate(dictionary)


  @stack = stack( margin: 20){
    @title = para 'Complete Me'
    # @title.style font: "Impact"
    @edit = edit_line
    @push_me = button "Use and remember"
    @suggestion1 = edit_line
    @suggestion2 = edit_line
    @suggestion3 = edit_line

    @suggestions = para ''

    flow do
    @edit.change() do
      if @edit.text.length <2
        @suggestion1.text = ''
        @suggestion2.text = ''
        @suggestion3.text = ''
        @suggestions.text = ''
        # @s_line.text = 'bananas'
      else
          words = complete_me.suggest(@edit.text).join(", ")
          @suggestion1.text = words.split(", ")[0]
          @suggestion2.text =words.split(", ")[1]
          @suggestion2.style font: "Verdana"
          @suggestion3.text =words.split(", ")[2]
          @suggestions.text = words
      end
    end

    @push_me.click do
      @edit.text.chars.length.times do |count|
        complete_me.select(@edit.text[0..count],@edit.text)
      end
    end
    end
  # end
  }

  @stack.style font: 'Verdana'







}
