#!/usr/bin/env ruby -wKU

def version(fn)
  str = open(fn){|f| f.read}
  str.scan(/<key>CFBundleVersion<\/key>\s+<string>([\d\.]+)<\/string>/)[0][0]
end

def gitcommit
#  `git show | head -n 1 | cut -d' ' -f2`.chop
  id = '(unknown)'
  head = open('.git/HEAD'){|f| f.read}
  if head
    fn = head.scan(/^ref:\s(.+)/)[0][0]
    id = open('.git/'+fn){|f| f.read}.chop
  end
  id
end

if $0 == __FILE__
end
