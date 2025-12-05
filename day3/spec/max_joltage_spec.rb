require_relative '../max_joltage.rb'

RSpec.describe "MaxJoltage" do
  describe "#find_max_joltage" do
    let(:jol) { MaxJoltage.new }

    it "returns the maximum joltage from a bank of batteries" do
      expect(jol.find_max_joltage("987654321111111")).to eq(98)
    end

    it "returns the maximum joltage from a bank of batteries" do
      expect(jol.find_max_joltage("811111111111119")).to eq(89)
    end

    it "returns the maximum joltage from a bank of batteries" do
      expect(jol.find_max_joltage("234234234234278")).to eq(78)
    end

    it "returns the maximum joltage from a bank of batteries" do
      expect(jol.find_max_joltage("818181911112111")).to eq(92)
    end

    # it "handles an empty list of a bank of batteries" do
    #   battery_bank = []
    #   expect(jol.find_max_joltage(battery_bank)).to eq(0)
    # end

    it "returns the correct maximum joltage for a larger set of battery_bank" do
      battery_bank = "987654321111111
        811111111111119
        234234234234278
        818181911112111"
      puts jol.sum_max_joltage(battery_bank)
      expect(jol.sum_max_joltage(battery_bank)).to eq(357)
    end
  end
end
