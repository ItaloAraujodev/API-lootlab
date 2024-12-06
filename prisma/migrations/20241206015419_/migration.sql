/*
  Warnings:

  - The `score` column on the `Post` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `marketCap` on the `LaunchInfo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `totalSupply` on the `LaunchInfo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `privateSale` on the `LaunchInfo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `publicSale` on the `LaunchInfo` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `investment` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "LaunchInfo" DROP COLUMN "marketCap",
ADD COLUMN     "marketCap" DOUBLE PRECISION NOT NULL,
DROP COLUMN "totalSupply",
ADD COLUMN     "totalSupply" INTEGER NOT NULL,
DROP COLUMN "privateSale",
ADD COLUMN     "privateSale" DOUBLE PRECISION NOT NULL,
DROP COLUMN "publicSale",
ADD COLUMN     "publicSale" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "investment" VARCHAR(255) NOT NULL,
DROP COLUMN "score",
ADD COLUMN     "score" INTEGER NOT NULL DEFAULT 0;
