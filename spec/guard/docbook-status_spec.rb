
#require File.join(File.dirname(__FILE__), %w[spec_helper])
require 'spec_helper'
require 'guard'
require 'guard/ui'
require 'guard/watcher'
require 'fileutils'

module Guard
  describe DocbookStatus do

    before(:each) do      
      FileUtils.cp_r 'spec/fixtures/', 'spec/work/'      
      @gdbs = DocbookStatus.new
    end

    after(:each) do
      FileUtils.rm_rf 'spec/work'
    end

    describe "start" do
      it "should trigger dbs on start" do
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus has started watching your files",{})
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus detected a change",{})
        ::Guard::UI.should_receive(:error).with("docbook_status indicated an error",{})
        @gdbs.start
      end

      it "should process a file on start" do
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus has started watching your files",{})
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus detected a change",{})
        ::Guard::UI.should_not_receive(:error)
        @gdbs = DocbookStatus.new(["*.xml"],{:cli => 'spec/work/bookxi.xml'})
        @gdbs.start
      end
    end

    describe "run_on_change" do
      it "should process a file in the working dir" do
        w = Watcher.new("spec/work/*.xml")
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus has started watching your files",{})
        @gdbs = DocbookStatus.new([w],{:cli => 'spec/work/bookxi.xml'})
        @gdbs.should_receive(:run_on_changes).twice
        @gdbs.start
        @gdbs.run_on_changes(["chapter2xi.xml"])
        
      end
      it "should process a file in a subdir" do
        w = Watcher.new("spec/work/**/*.xml")
        ::Guard::UI.should_receive(:info).with("Guard::DocbookStatus has started watching your files",{})
        @gdbs = DocbookStatus.new([w],{:cli => 'spec/work/bookxi.xml'})
        @gdbs.should_receive(:run_on_changes).twice
        @gdbs.start
        @gdbs.run_on_changes(["/spec/work/chapter4xi.xml"])
      end      
    end
  end
end

