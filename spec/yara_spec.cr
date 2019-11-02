require "./spec_helper"

describe Yara do
  describe "Yara" do
    describe "#initialize" do
      it "initializes class" do
        yara = Yara::Yara.new
        yara.should_not be_nil
      end
    end
    describe "#finalize" do
      it "finalizes class" do
        yara = Yara::Yara.new
        yara.finalize
      end
    end
  end

  describe "Compiler" do
    describe "#initialize" do
      it "initializes class" do
        compiler = Yara::Compiler.new
        compiler.should_not be_nil
      end
    end
    describe "#finalize" do
      it "finalizes class" do
        compiler = Yara::Compiler.new
        compiler.finalize
        expect_raises(Yara::YaraException, "Cannot compile with finalized compiler") do
          compiler.compile
        end
      end
    end
    describe "#add_input_src" do
      # pending "works on files C way" do
      #   compiler = Yara::Compiler.new
      #   compiler.add_input_src("spec/dummy.yara")
      #   compiler.finalize
      # end
      it "works on files" do
        compiler = Yara::Compiler.new
        compiler.add_input_src(File.new("spec/dummy.yara"))
        compiler.finalize
      end
      it "works on file descriptors" do
        compiler = Yara::Compiler.new
        compiler.add_input_src(File.new("spec/dummy.yara").fd, "dummy")
        compiler.finalize
      end
      it "works on strings" do
        compiler = Yara::Compiler.new
        compiler.add_input_src("rule dummy{condition:false}")
        compiler.finalize
      end
    end
  end
end
