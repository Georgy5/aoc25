require_relative "../gift_shop.rb"

describe "Gift Shop product IDs" do
  describe "#is_id_invalid?" do
    it "returns a product id found to be invalid" do
      expect(is_id_invalid?(22)).to eq(true)
    end

    it "returns a product id found to be invalid" do
      expect(is_id_invalid?(123123)).to eq(true)
    end

    it "returns false for a valid product id" do
      expect(is_id_invalid?(1234)).to eq(false)
    end
  end

  describe "#get_invalid_ids?" do
    it "returns a list of all of the invalid IDs in a range" do
      expect(get_invalid_ids(11..22)).to eq([11, 22])
    end

    it "returns a list of all of the invalid IDs in a range" do
      expect(get_invalid_ids(99..115)).to eq([99])
    end
  end

  # describe "#sum_invalid_ids" do
  #   it "adds up all the invalid IDs" do
  #     pending("something else getting finished")
  #     expect(sum_invalid_ids).to eq(true)
  #   end
  # end
end
