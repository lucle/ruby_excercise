module Common
    def self.countDuplicate(arr)
        hash = Hash.new(0)
        arr.each do |v|
            hash[v] += 1        
        end
        hash
    end
end