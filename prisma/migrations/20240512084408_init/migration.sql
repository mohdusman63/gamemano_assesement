-- CreateTable
CREATE TABLE "TitleRatings" (
    "id" SERIAL NOT NULL,
    "tconst" TEXT NOT NULL,
    "averageRating" DOUBLE PRECISION NOT NULL,
    "numVotes" INTEGER NOT NULL,

    CONSTRAINT "TitleRatings_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TitleRatings_tconst_key" ON "TitleRatings"("tconst");

-- AddForeignKey
ALTER TABLE "TitleRatings" ADD CONSTRAINT "TitleRatings_tconst_fkey" FOREIGN KEY ("tconst") REFERENCES "Title"("tconst") ON DELETE RESTRICT ON UPDATE CASCADE;
