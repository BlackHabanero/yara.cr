require "./spec_helper"

describe Yara do
  yara = uninitialized Yara::Yara
  compiler = uninitialized Yara::Compiler
  rules = uninitialized LibYara::YrRules*

  describe "Yara" do
    describe "#initialize" do
      it "initializes class" do
        yara = Yara::Yara.new
        yara.should_not be_nil
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

    describe "#add_input_src" do
      # pending "works on files C way" do
      #   compiler = Yara::Compiler.new
      #   compiler.add_input_src("spec/dummy.yara")
      #   compiler.finalize
      # end
      it "works on files" do
        compiler.add_input_src(File.new("spec/dummy.yara"))
      end
      it "works on file descriptors" do
        compiler2 = Yara::Compiler.new
        compiler2.add_input_src(File.new("spec/dummy.yara").fd, "dummy")
      end
      it "works on strings" do
        compiler2 = Yara::Compiler.new
        compiler2.add_input_src(<<-DUMMY
        rule dummy
        {
            condition:
               false
        }
        DUMMY
        )
      end
    end

    describe "#def_external_var" do
      it "works on strings" do
        compiler.def_external_var("a", "b")
      end
      it "works on booleans" do
        compiler.def_external_var("b", true)
      end
      it "works on floats" do
        compiler.def_external_var("c", 8.2588.to_f64)
      end
      it "works on integers" do
        compiler.def_external_var("d", LibC::Long.new(82588))
      end
    end

    describe "#compile" do
      it "compiles rules" do
        rules = compiler.compile
      end
    end
  end

  describe "RulesManager" do

    describe "#def_external_var" do
      it "works on strings" do
        Yara::RulesManager.def_external_var(rules, "a", "c")
      end
      it "works on booleans" do
        Yara::RulesManager.def_external_var(rules, "b", false)
      end
      it "works on floats" do
        Yara::RulesManager.def_external_var(rules, "c", 6.66.to_f64)
      end
      it "works on integers" do
        Yara::RulesManager.def_external_var(rules, "d", LibC::Long.new(666))
      end
    end

    describe "#destroy_rules" do
      it "destroys rules" do
        Yara::RulesManager.destroy_rules(rules)
      end
    end
  end

  describe "Compiler" do
    describe "#finalize" do
      it "finalizes class" do
        compiler.finalize
      end
    end
  end

  describe "Yara" do
    describe "#finalize" do
      it "finalizes class" do
        yara.finalize
      end
    end
  end
end
