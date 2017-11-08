Circular Buffer
===============

Circular buffer data structure

A circular buffer implements the following six methods and two properties:
```
push() - Adds an element to the end of a buffer

pop() - Returns and removes the front element from the buffer

peek() - Returns the front element from the buffer, but does not remove it

clear() - Resets the buffer to an empty state

isEmpty() - Returns true if the buffer is empty, and false otherwise

isFull() - Returns true if the buffer is full, and false otherwise

count - Returns the number of elements in the buffer

capacity - A read/write property for returning or setting the buffer capacity
```
Common implementations can also include helper methods such as the following:
```
insert(_:atIndex) - A method that inserts an element at a specified index in the buffer

removeAtIndex(_) - A method that removes an element at the specified index
```


Applications

The use of circular buffers is common for performing video or audio processing,

for example, a video capturing application that is recording a live stream. 

Since writing to disk is a slow operation, you can write the incoming video stream to a circular buffer;

we'll call this thread the producer. 

Then, within another thread, the consumer, you would read elements from the buffer

and write them to some form of durable storage.

Another similar example is when processing an audio stream.

You could write the incoming stream to the buffer and 

have another thread that applies audio filtering before writing it to durable storage or playback.


Ref
---
https://github.com/raywenderlich/swift-algorithm-club/tree/master/Ring%20Buffer
