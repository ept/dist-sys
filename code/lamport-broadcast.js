// Called by the user when they want to send a message
function totalOrderBroadcast(msg) {
  counter++;
  let m = (counter, proc, msg);
  sendFIFO(m); // use underlying FIFO broadcast
}

// Called by the FIFO broadcast layer when a message is received
function deliverFIFO(m) {
  let (msgCounter, sender, msg) = m;
  if (counter < msgCounter) counter = msgCounter; // Lamport clock update
  counter++;
  holdback.add((msgCounter, sender), msg);
  minLamport[sender] = msgCounter; // latest timestamp seen from each node
  tryDelivery();
}

// Examines the holdback queue. Delivers any messages that are ready to the
// application, in increasing Lamport timestamp order.
function tryDelivery() {
  let threshold = getThreshold();
  while (!holdback.empty()) {
    let (timestamp, msg) = holdback.getMin();
    if (timestamp > threshold) break;
    deliverTotalOrder(msg);
    holdback.remove(timestamp);
  }
}

// Returns the threshold, which is the minimum latest timestamp across all
// nodes. Due to FIFO ordering we know that all future messages delivered
// to deliverFIFO() will have a timestamp greater than this threshold.
function getThreshold() {
  let minimum = (+infinity, null);
  foreach p in procs {
    let timestamp = (minLamport[p], p);
    // The following comparison uses the total order on Lamport timestamps
    if (timestamp < minimum) minimum = timestamp;
  }
  return minimum;
}
