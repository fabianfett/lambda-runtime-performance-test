import LambdaRuntime
import NIO

let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
defer { try! group.syncShutdownGracefully() }

do {
  let allocator = ByteBufferAllocator()
  let string = "Hello World"
  let runtime = try Runtime.createRuntime(eventLoopGroup: group) { (_, ctx) in
    var buffer = allocator.buffer(capacity: string.utf8.count)
    buffer.writeString(string)
    return ctx.eventLoop.makeSucceededFuture(buffer)
  }

  defer { try! runtime.syncShutdown() }
  
  try runtime.start().wait()
}
catch {
  print("\(error)")
}
