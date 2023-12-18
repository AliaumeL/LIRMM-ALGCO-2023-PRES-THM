---
title: Draft
author: Aliaume LOPEZ
date: today
header-includes: |
  <script>
    function connect() {
      const ws = new WebSocket("ws://localhost:56789");
      ws.onopen = () => setTimeout(() => ws.send("keepalive"), 30000);
      ws.onclose = () => setTimeout(connect, 1000);
      ws.onmessage = () => location.reload();
    }
    connect();
  </script>
---

# Section


## Subsection 

### Frame {.standout}

How do we make a block
[@poly:CDL23]

### Frame bis
