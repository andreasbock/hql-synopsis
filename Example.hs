--
-- Data types representing financial instruments
--

data CommonBond = CommonBond {
  cprincipal      :: Payment,
  ctermstructure  :: TermStructure
}

newtype Zero = Zero { zero :: CommonBond }

data Annuity = Annuity {
    abase   :: CommonBond,
    acoupon :: Double
}

--
-- Hierarchy of classes
--

class Instrument i where
  pv       :: i -> DiscountFunction -> Payment
  cashflow :: i -> CashFlow

class Instrument b => Bond b where
  principal :: b -> Payment
  coupon    :: b -> Payment
  maturity  :: b -> Date
  ytm :: b -> Payment
  duration :: b -> Payment
  discount :: b -> DiscountFunction
  ... 

class Instrument d => Derivative d where
  underlying :: (Instrument i) => d -> i
  ...

instance Instrument Zero where
  ...

instance Bond Zero where
  ...
