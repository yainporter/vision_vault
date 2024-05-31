require "rails_helper"

RSpec.describe UnsplashImage do
  describe "initialization" do
    context "correctly formatted data is passed" do
      it "returns an Unsplash object with a title, description, and html link" do
        data =
          {
            "slug"=>"litter-of-dogs-fall-in-line-beside-wall-U6nlG0Y5sfs",
            "description"=>"Pink Wall Full of Dogs",
            "alt_description"=>"litter of dogs fall in line beside wall",
            "created_at"=>"2018-06-20T05:22:40Z",
            "urls"=> {
              "full"=>
                "https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=85&utm_source=571598&utm_medium=referral&utm_campaign=api-credit",
              "regular"=>
                "https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=80&w=1080&utm_source=571598&utm_medium=referral&utm_campaign=api-credit",
              "small"=>
                "https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=80&w=400&utm_source=571598&utm_medium=referral&utm_campaign=api-credit"
            }
          }

        data = JSON.parse(data.to_json, symbolize_names: true)
        image = UnsplashImage.new(data)
        expect(image.title).to eq("litter-of-dogs-fall-in-line-beside-wall-U6nlG0Y5sfs")
        expect(image.description).to eq("Pink Wall Full of Dogs")
        expect(image.alt_description).to eq("litter of dogs fall in line beside wall")
        expect(image.created_at).to eq("2018-06-20T05:22:40Z")
        expect(image.regular_size).to eq("https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=80&w=1080&utm_source=571598&utm_medium=referral&utm_campaign=api-credit")
        expect(image.small).to eq("https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=80&w=400&utm_source=571598&utm_medium=referral&utm_campaign=api-credit")
        expect(image.full_size).to eq("https://images.unsplash.com/photo-1529472119196-cb724127a98e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w1NzE1OTh8MHwxfHNlYXJjaHwxfHxkb2dzfGVufDB8fHx8MTcxNzE4OTAzN3ww&ixlib=rb-4.0.3&q=85&utm_source=571598&utm_medium=referral&utm_campaign=api-credit")
      end
    end
  end
end
