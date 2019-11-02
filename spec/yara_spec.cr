require "./spec_helper"

describe Yara do
  context "::Yara" do
    it "is initialized" do
      yara = Yara::Yara.new
    end
    it "is finalized" do
      yara = Yara::Yara.new
      yara.finalize
    end
  end
  context "::Compiler" do
    it "is initialized" do
      compiler = Yara::Compiler.new
    end
    it "is finalized" do
      compiler = Yara::Compiler.new
      compiler.finalize
    end
  end
end
