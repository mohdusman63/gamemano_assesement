-- CreateTable
CREATE TABLE "TitlePrincipals" (
    "id" SERIAL NOT NULL,
    "tconst" TEXT NOT NULL,
    "ordering" INTEGER NOT NULL,
    "nconst" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "job" TEXT,
    "characters" TEXT,

    CONSTRAINT "TitlePrincipals_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TitlePrincipals_tconst_key" ON "TitlePrincipals"("tconst");

-- AddForeignKey
ALTER TABLE "TitlePrincipals" ADD CONSTRAINT "TitlePrincipals_tconst_fkey" FOREIGN KEY ("tconst") REFERENCES "Title"("tconst") ON DELETE RESTRICT ON UPDATE CASCADE;
