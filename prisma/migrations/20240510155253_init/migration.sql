-- CreateTable
CREATE TABLE "Title" (
    "titleId" TEXT NOT NULL,
    "ordering" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "language" TEXT NOT NULL,
    "types" TEXT[],
    "attributes" TEXT[],
    "isOriginalTitle" BOOLEAN NOT NULL,

    CONSTRAINT "Title_pkey" PRIMARY KEY ("titleId")
);
