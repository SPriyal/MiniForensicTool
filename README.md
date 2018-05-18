# MiniForensicTool

Mini Forensic Tool: The sender and receiver shared a symmetric key k1 as the root key. (E,D) denote a symmetric encryption and decryption algorithm, respectively. Using AES as the symmetric cipher with 256-bit key. H denotes a secure crypto- graphic hash function. Chose SHA-256. Used available functions from MIRACL library to realize (E, D, H). 
(l, t) are RID parameters.



Sender Algorithm: processing i’th data item Mi (i > 1)

	1) Mi′ ← Compress(Mi) 
	2) ci ←Eki(Mi′)
	3) si ← HMACki (ci||i) 
	4) s1,i ← H(s1,i−1||si)
	5) ki+1 ← H(ki)
	6) Delete (ki, si, s1,i−1) from the memory, i ← i + 1.
	7) Finally, the sender reaches the state n, wherein the collector comes to collect the encrypted data items and their aggregate authentication tag denoted as V =(⟨c1,...,cn⟩,s1,n). The sender applies RID as V′ ← Dispersal(V,l,t), and uploads V ′ to the collector.



Receiver Algorithm: Lets assume the receiver (i.e., collector) receives at least l pieces out of t as required by RID.

	1) V ←Recover(V′,l,t),whereV =(⟨c1,...,cn⟩,s1,n)
	2) kj+1 ← H(kj), j = 1,...,n
	3) sj ← HMAC(cj||j), j = 1,...,n
	4) s′1,n ← H(s1,j−1||sj), j = 2,...,n, computed recursively, where the base case
	is s1,1 = s1.
	5) If s′1,n ̸= s1,n then abort, else continue.
	6) Mj′ ←Dkj(cj),j=1,...,n
	7) Mj ← Decompress(Mj′) j = 1,...,n
	8) The receiver recovers the telemetry (M1, . . . , Mn).
