package coprocessing.data

import coprocessing.primitives.{_, given _}

import opaques.arrayOps._
import cats.Show

type Matrix3D = Matrix
object Matrix3D {
  def apply(n00: Scalar, n01: Scalar, n02: Scalar, n03: Scalar)
           (n10: Scalar, n11: Scalar, n12: Scalar, n13: Scalar)
           (n20: Scalar, n21: Scalar, n22: Scalar, n23: Scalar)
           (n30: Scalar, n31: Scalar, n32: Scalar, n33: Scalar): Matrix3D =
    Matrix(n00, n01, n02, n03)(n10, n11, n12, n13)(n20, n21, n22, n23)(n30, n31, n32, n33)
  val Identity = IdentityMatrix
}

given Show[Matrix3D] {
  private val Format = """Matrix3D(%+.5f, %+.5f, %+.5f, %+.5f)
                         |        (%+.5f, %+.5f, %+.5f, %+.5f)
                         |        (%+.5f, %+.5f, %+.5f, %+.5f)
                         |        (%+.5f, %+.5f, %+.5f, %+.5f)""".stripMargin
  def show(m: Matrix3D) =
    String.format(Format, m.foldRight(List.empty[AnyRef])(_::_): _*).nn
}

extension on (self: Matrix3D) {
  def toArray: IArray[Scalar] = unwrapM(self)
  def apply(v: Vector3D): Vector3D = mulMV(self, v)
  def compose(other: Matrix3D): Matrix3D = mulMM(self, other)
  def andThen(other: Matrix3D): Matrix3D = other compose self
}
