require 'colorize'

Then(/^(the following expectations are met):$/) do | step_name, table |
    failed_steps = 0
    print "  Then #{step_name}:\n"
    table.each_cells_row do | row |
        expectation = row.value(0)
        print "    #{expectation}:"
        puts expectation
        begin
            step(expectation)
            print " Pass\n".green
            failed = 0
        rescue Exception => err
            failed_steps += 1
            print " Fail\n".red
            puts "  failure: #{err}"
            puts "    #{cucumber_stacktrace_head(err).join("\n    ")}"
        end
    end
    expect(failed_steps).to eq 0
end

def cucumber_stacktrace_head(error)
    error.backtrace.take_while { |line|
        line !~ /cucumber_instance_exec/
    }
end
