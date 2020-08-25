require "simple_LRU_cache"

describe LRUCache do
    subject(:small_cache) { LRUCache.new(4) }
    subject(:large_cache) { LRUCache.new(20) }

    it "should not expose a reader or writer for @underlying_arr" do
        expect(:small_cache).to not_respond_to(:underlying_arr, :underlying_arr=)
    end
    
    describe "#initialize" do
        it "should take in an Integer and set it to the cache capacity"
        it "should set @underlying_arr to an empty array"
    end

    describe "#count" do
        it "returns number of elements currently in cache"
    end

    describe "#add" do
        # it "adds element to cache according to LRU principle"
        context "if element is already in cache" do
            it "delete the element and add it to front of the cache"
        end
        context "if element is not already in cache" do
            context "when cache has not reached capacity" do
                it "adds the element to the front of the cache"
            end
            context "when cache has already reached capacity" do
                it "deletes least recently used element"
                it "adds the new element to the front of the cache"
            end
        end
    end

    describe "#show" do
        it "shows the items in the cache, with the LRU item first"

    end

end