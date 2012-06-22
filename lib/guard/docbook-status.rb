# -*- encoding: utf-8 -*-
require 'guard'
require 'guard/guard'
require 'guard/watcher'

module Guard
  class DocbookStatus < Guard
    
    def initialize(watchers=[], options={})
      super
      @options = {
        :trigger_on_start => true
      }.update(options)
    end

    def start
      ::Guard::UI.info("Guard::DocbookStatus has started watching your files",{})
      run_all if @options[:trigger_on_start]
    end

    def run_all
      run_on_changes([])
    end

    def run_on_changes(paths)
      ::Guard::UI.info("Guard::DocbookStatus detected a change",{})
      output = system("docbook_status #{@options[:cli]}")
      command_failure = ($?.to_i != 0)
      if command_failure
        ::Guard::UI.error("docbook_status indicated an error",{})
      end
    end
  end
end
    
