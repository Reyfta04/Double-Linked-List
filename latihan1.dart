class DNode<T> {
  T nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.nodeValue);
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  // Menambahkan node di akhir agar mudah buat testing
  void tambahAkhir(DNode<T> newNode) {
    if (head == null) {
      head = newNode;
    } else {
      DNode<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
      newNode.prev = temp;
    }
  }

  // Tambah node sebelum node target (forward traversal)
  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    newNode.next = target;
    newNode.prev = target.prev;

    if (target.prev != null) {
      target.prev!.next = newNode;
    } else {
      head = newNode;
    }
    target.prev = newNode;
  }

  // Cetak list (maju)
  void printMaju() {
    DNode<T>? temp = head;
    print("Isi list (maju):");
    while (temp != null) {
      print(temp.nodeValue);
      temp = temp.next;
    }
  }
}

void main() {
  var list = DoubleLinkedList<int>();

  var node1 = DNode(10);
  var node2 = DNode(20);
  var node3 = DNode(30);

  list.tambahAkhir(node1);
  list.tambahAkhir(node3);

  // Tambahkan node2 (20) sebelum node3
  list.tambahNode_Sebelum(node2, node3);

  list.printMaju();
}
