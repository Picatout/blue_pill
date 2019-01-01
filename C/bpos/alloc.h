

#ifndef ALLOC_H
#define ALLOC_H

// alloue un bloc mémoire
// size est en octets.
void* alloc(unsigned size);
// ptr valeur retournée par alloc()
// tout ce qui a été alloué après 'ptr' est limité
// comme dans FORTH.
void free(void* ptr);

#endif // ALLOC_H
