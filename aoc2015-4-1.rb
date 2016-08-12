require 'digest'
data = "bgvyzdsv"
zc = 6 #leading 0 count
 
(0..Float::INFINITY).lazy.each{|n|
        puts n if Digest::MD5.new.update(data+n.to_s).hexdigest[0, zc] == '0' * zc
}