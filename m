Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6A606A31A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Oct 2026 17:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hDkIR1q1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A599310E376;
	Wed, 21 Oct 2026 17:02:29 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9320010E376
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 17:02:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso1354489a12.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1792602142; x=1793206942;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EjCuUwpomnnJOqEQ0aOYfzzrmAC2AQlZYb4tqJTWlT8=;
 b=hDkIR1q1K4VLJB/d03mTPN3B5EvjvUI0omY+H5ZRYHIAihnco9D2H7uRvvPtKkiN6z
 QCmrjeZJz3JTCPJGYlE+hYe5WuPb6Zmwzg9xEQW2NdwtW7QvTGt7wCjkrBP55jcsMvbj
 39DgQbOhO2RE6tfp/FKCNpIZsgziuUx6QmOQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792602142; x=1793206942;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EjCuUwpomnnJOqEQ0aOYfzzrmAC2AQlZYb4tqJTWlT8=;
 b=RC/J9R6BWdVro5Z2zaSxnFAkcg3K0QtL37NHqyVYpk1bqRz/+2H86DG/B6e63GTTpn
 ObwUPwDHvkNWp56BWFdBgsbu5vO+FjpZVLzAH+sGTkU5HZ6ExJHZs8xZkDiLqGrvHpJg
 V24AXKelmUP2iiLpFfbv8a5EL9dNNka8Ytkz9BJqin+Jgx5CU/k2ief29mQjFma2nmIA
 78ttjzrcJvH80oF5tLH/bfhFhA9uifalgLjTlvBjmX+2TRMV+Mw+0QZE7nYnuB2rXC+Q
 DrLjA1qNVoCcf7KESHhGwxYGMWULXbY6VyV5wD8WEfSJ7DaLivCGv72opnYY49evnWlC
 zeSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbNKXAORONcdDvUg6hmk9Dwm9N3zQi+FAu9dn0oTDJkwfNgcDXe4nCPsKFqng6amncvnB6q6G7If8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIRnKgVGLaT48VAxx772lfkLTRJQp9DFn4q8wfkC0xKOSTCnLTf
 LQhFOEqvpANtDO6xnpmkjmGcSLVrpBDrTqUEgvecnuNLaT9ek+RTS53YIypOLCQ31NEwjMEhqkZ
 otdQmzSgwVw==
X-Gm-Gg: AYBFou38xe5n9hOxwb9dMIsBkO/dSQE9qSd0ZUO+GbOY4Z2w7FI1hHotHeY8HTaTR42
 vZXincYpcl/5YSTAYqKcXiMap+Xc0ldhuVq7Z9OPZqUy0+7a5Y+BjJ3lVcaKpzFVbYDTMM43VHH
 8CLkuC9uQdpeGXAj6lru6OtJ/Mkfmvdzz3hNt8C+CElKhXbFOqHj2DKftwT+AAd61IUf5b6Y/kR
 0ztVioVzGXFDkcgVOZtzTfOMEszZQdSW9QIDb9Xymj7w+vJEKRUAa8IZtM7hIValZhxEtR4eOQU
 /lhkbIg+y+mYiayakgeOOWl//qKtF8yV+h8LUAJXwqHlqSaja5edxEiI6zmKT0Y6gcFcMgtFcRD
 2KtlRj3XOWD8FrMfv+UxVnx/ZMzZIIwPWc41QZF0eU5JljlRwIjiLv15PlU3E1AUZamIj6BMlhU
 Suji2tSEB9J9iFzFiT7AM6eFGfFwTsRWsheEGMxT0x3sCKi9ordGsdxEOMWb/10DAQo+c0BVN5N
 1DaeSGnQyDH/n1+8mCKbgtRnfNbBA4ypFV2oZHmN/a0rW6K1ZPIre1rLEoXn/+8khNgyXr5b8N6
 hunY9U1TXscTBz1RYHEYIhM3dZ9deg==
X-Received: by 2002:a05:6402:51cb:b0:6b1:c34b:f1de with SMTP id
 4fb4d7f45d1cf-6b408ea8f83mr1936367a12.23.1792602141742; 
 Wed, 21 Oct 2026 10:02:21 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b402f2b8f9sm1085420a12.3.2026.10.21.10.02.21
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 10:02:21 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6af9a90e4bbso1089486a12.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Oct 2026 10:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzjoYmIWVKzCY5Z41w0/e0jftdZ60hUeXyeXw3H6rizp3a0Zc4ZIsmU3Bhk2HQLXbruZuQ3HA+06JI=@lists.freedesktop.org
X-Received: by 2002:a17:906:794c:b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c46797171bcmr253709766b.34.1792602141364; Wed, 21 Oct 2026
 10:02:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <6ad07f8a.a0c71a5e.2d2efd.977a@mx.google.com>
 <20261018152358-mutt-send-email-mst@kernel.org>
 <CAHk-=wiUn9EbV4TJ4J7OPY0fVc3UC+xb-pp=+rg3hRc4jQqihg@mail.gmail.com>
 <20261018174250-mutt-send-email-mst@kernel.org>
 <376ef9d0-b03f-4f85-aee5-46cf20eb00ae@gmail.com>
 <20261020021924-mutt-send-email-mst@kernel.org>
 <CAHk-=wjxtzD1TXZr5iWu0p1+Hu0YZP7jbNSwFkp7AJYmhzhVCA@mail.gmail.com>
 <CAHk-=wipGHx_1Uztmu773yuTM2ka1fq996UmNoJpvKS0gqEdMg@mail.gmail.com>
 <664c8f8c979a76be18b3e6538a15d3c4235fb8ac@intel.com>
 <atjp_I_dCfw0tW0W@intel.com>
In-Reply-To: <atjp_I_dCfw0tW0W@intel.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 21 Oct 2026 07:02:03 -1000
X-Gmail-Original-Message-ID: <CAHk-=whB5bOZ8C9dyoQT_SQQc=2HRaJNbdFuJUNne2bMkkCQHA@mail.gmail.com>
X-Gm-Features: AclHuK_g8l2EJDN48ZLd8K9V90bgnoz1MjFPcU7jmrVp6UUYwPtCB5cvD7AN8tQ
Message-ID: <CAHk-=whB5bOZ8C9dyoQT_SQQc=2HRaJNbdFuJUNne2bMkkCQHA@mail.gmail.com>
Subject: Re: Removing __get_user / __put_user for good
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Andi Shyti <andi.shyti@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Borislav Petkov <bp@alien8.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Joerg Roedel <joerg.roedel@amd.com>, "Nikunj A. Dadhania" <nikunj@amd.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 at 06:36, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> The new commit 'drm/i915/gem: Don't fault on presumed_offset write-back' [1]
>
> reverts commit '97a37c919f62 ("drm/i915/gem: Ignore readonly failures when
> updating relocs")'
>
> And this blows up exec_reloc concurrent tests that uses
> mprotect(reloc, sz, PROT_READ); [2]

The old code had two separate bugs:

 - it used __put_user() while holding locks that could deadlock with
fault handling

   Fixed with the pagefault_disable() around the put_user()

 - it didn't actually check failures, so a read-only area silently
just dropped the write

   Fixed with that "if (unlikely(err))" addition

But yes, I didn't see that the error handling had been removed - the
removal didn't show up in the code

So I'll remove the error handling from me branch before merging.

But that code absolutely smells, though. It makes no sense to silently
drop the relocations and just go on - and continue in that loop that
will then drop the next one. And the one after.. You're just wasting
CPU time and doing nothing useful.

So I will merge it with that error handling removed, but I suspect
that test is bogus garbage, and was testing for a bug, not testing for
actual behavior. But I may be wrong.

But the __put_user() and the pagefault_disable() around it stays.  The
old code was very very buggy - and not in a "waste CPU time" way, but
in a "you could cause deadlocks and lockdep issues" kind of way.

                  Linus
