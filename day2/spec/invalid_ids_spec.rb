require_relative "../gift_shop.rb"

describe "Gift Shop product IDs" do
  describe "#is_id_invalid?" do
    it "returns a product id found to be invalid" do
      expect(is_id_invalid?(id_range)).to eq(true)
    end

    it "returns a product id found to be valid" do
      expect(is_id_invalid?(id_range)).to eq(false)
    end
  end

  describe "#sum_invalid_ids" do
    pending "adds up all the invalid IDs" do
      expect(sum_invalid_ids(input)).to eq(true)
    end
  end
end
