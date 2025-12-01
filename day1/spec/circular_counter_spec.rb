require_relative "../circular_counter.rb"

# ROTATIONS = "L68
# L30
# R48
# L5
# R60
# L55
# L1
# L99
# R14
# L82"

describe CircularCounter do
  describe "#pos" do
    it "The dial starts by pointing at 50" do
      expect(subject.pos).to eq(50)
    end
  end

  describe "#password_counter" do
    it "The password counter is initalised to 0" do
      expect(subject.password_counter).to eq(0)
    end
  end

  describe "#move" do
    it "The dial turns left 68 clicks" do
      expect(subject.move("L68")).to eq(82)
    end

    it "The dial turns left 30 clicks" do
      expect(subject.move("L30")).to eq(20)
    end

    it "The dial turns right 48 clicks" do
      expect(subject.move("R48")).to eq(98)
    end

    it "The dial turns right 55 clicks" do
      expect(subject.move("R55")).to eq(5)
    end
  end

  describe "#password_counter" do
    it "The dial pointed to zero once" do
      subject.move("R50")
      expect(subject.password_counter).to eq(1)
    end
  end
end
