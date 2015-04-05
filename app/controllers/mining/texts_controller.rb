require 'natto'

class Mining::TextsController < ApplicationController
  def show
    text = <<"EOS"
    テストします。ほげほげ馬鹿と。
EOS

    create_text(text)
  end

  private
    def create_text(text)
      @word = {}
      nm = Natto::MeCab.new.parse(text) do |n|
        @word[n.surface] = n.feature unless n.nil? || n.surface.nil? || n.feature.nil?
      end
    end
end
