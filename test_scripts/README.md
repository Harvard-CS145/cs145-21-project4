## Testing Your Solutions

We provide a proxy-based testing script to help verify the correctness of your solution. 
The testing script initiates connections with your receiver and sender separately, and forward packets with random delay, reordering, drops, or modifications. 

Before the test, you should put these files to the same folder:
    Solution files: receiver.py, send.py, util.py
    Test files: proxy.py, test_message.txt, compare.sh

Following the fours steps to test: 
1. start the receiver: `python receiver.py [port_recv] [window_size] > [output_file]`
    * Eg, `python receiver.py 40000 128 > output.txt`. 
    * Receiver listens on port 40000.
2. start the proxy: `python proxy.py localhost [port_send] localhost [port_recv] [error_type]`
    * Eg, `python proxy.py localhost 50000 localhost 40000 0123`. 
    * Proxy listens on port 50000 (waiting for connection from sender); proxy connects to port 40000; we choose all four types of errors. 
3. start the sender: `python sender.py localhost [port_send] [window_size] < test_message.txt`
    * Eg, `python sender.py localhost 50000 128 < test_message.txt`. 
    * Sender connects to port 50000 (where proxy is listening on -- here completes the packet forwarding). 
4. compare result: `bash compare.sh [output_file] test_message.txt`
    * Eg, `bash compare.sh output.txt test_message.txt`. 
    * You should delete the old `output.txt` before testing your new solution. 
    * If you see *SUCCESS: Message received matches message sent!* printed, then you solution passes the test!