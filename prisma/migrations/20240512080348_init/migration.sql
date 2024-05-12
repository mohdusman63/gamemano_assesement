-- CreateTable
CREATE TABLE "TitleCrew" (
    "id" SERIAL NOT NULL,
    "tconst" TEXT NOT NULL,
    "directors" TEXT[],
    "writers" TEXT[],

    CONSTRAINT "TitleCrew_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TitleCrew_tconst_key" ON "TitleCrew"("tconst");

-- AddForeignKey
ALTER TABLE "TitleCrew" ADD CONSTRAINT "TitleCrew_tconst_fkey" FOREIGN KEY ("tconst") REFERENCES "Title"("tconst") ON DELETE RESTRICT ON UPDATE CASCADE;
