export function BrandMark({ className = '' }: { className?: string }) {
  return (
    <svg className={className} width="29" height="29" viewBox="0 0 32 32" fill="none" aria-hidden="true">
      <path d="M16 2v28M2 16h28M6.1 6.1l19.8 19.8M6.1 25.9 25.9 6.1" stroke="currentColor" strokeWidth="2.6" />
      <circle cx="16" cy="16" r="5" fill="currentColor" />
    </svg>
  )
}
