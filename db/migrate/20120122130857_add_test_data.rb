class AddTestData < ActiveRecord::Migration
  def up
    Product.delete_all
    Product.create(:title => 'GET OUT OF MY WAY',
                   :description =>
                %{<p>
                
                Blessings tackle those who get out the way!
                You don't need manipulation, trickery or foolish ambition -
                you just need to step aside and let the King of Glory enter
                into your every circumstance. In this latest teaching,
                T D Jakes masterfully uses the story of Jesus Christ and
                John the Baptist to sharethe secret to fulfilling
                your wildest dreams and highest goals.
                
                </p>},
                :author => 'T.D Jakes',
                :price => 14.34)
                # . . .
  end


  def self.down
    Product.delete_all
  end
end

