Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F7AECD9B9
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Feb 2026 01:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318F10E232;
	Fri,  6 Feb 2026 01:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOGyYXNo";
	dkim-atps=neutral
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175B10E232
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Feb 2026 01:48:59 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8c710439535so103131285a.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Feb 2026 17:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
 d=google.com; s=arc-20240605;
 b=X5BBb4cRkRAMH0PdhkQMuEOqAP/FiZDTB9XcjN1q2BiB44dJ6xBN+Ug4rXFeRiPfxD
 998XZ1p7BjL9qa5a60Fo8zVbBXw/ex912KMODgW5crb2DWUUYRSH11PAfbghxcNLnMkB
 Hx5C9dsG9y20r4lF5OHZcM88a7YVBoIPquyMNTapXh3Nri0m10zpDQQSCRTJANwxjYuG
 Ncfu8TX7FaOW0KQlsRtwgsZ/00SNJ1PZm08Pb2PAlYsnA3rcMa+D/cfTTs1VjYxsk69W
 fGla6NzZ11tM5OFebYvlIwFgIMHGcDr+kS3zS7d/Rhxaaw5Q16gleSltHSTu0viWvCG1
 1jog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 fh=G9w8YMqmeE5gQP46eCKmmwVYPsFJ/ju5FC4fkbh210Y=;
 b=KyUD053lHMA+5knQgnoGfpGtFhI9wCUKQ8fXiVHYNcOvwQM0V0fBTnvKQjpJvv1Pv/
 w+oaSrTZ9s10GID12ddCwHDhYjw7SvjxWOHLxRxjKL+pTy3YeWFLrFaNb5zt9i23KKfi
 y3WM1vzUak0IFRZ/CCpvfcq40f1licx3XxYm4u6evs3kD20miUjHoiiab0wv8L/7juOo
 iQu2i/6OiXJb6Fy8caI4HMZSpn8JqmSAYR6I08Zb9VeBuJ4iFke0AJFX4z6dOJkNHZA8
 1ea5tlsw1i/PD4vY32MCQQb805IO8jZDNZACj6btM0cgjuNQ5BMdF6cQ8z1c0AFsEg6B
 jwmA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770342538; x=1770947338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=FOGyYXNo3zdhE8TI2jZvS3WKO9tc0UOjwoHxA44fr3olnCUVAYjEt1s2Ijbcy9CmL2
 GFElgEB2Fr1AculDojwKTWUEFc2SOluzkosXBVs5mkwjPnE6h1z+NjkS0BYdU6n0AP9K
 +kzW+eVfatMIQNNNLNKd0sR5zpRzn+kY4CiUWEMgJIIz7bRi66pWAUmwKWErbxV0tNXl
 LKRSkp5cc2RO3Y1iy2cE+I7Ap40WKPBpD7xjqn9KMdGd1qhpZFMuSg51MrkyBDdjxZNj
 IEqfGOG6bZvOQWFId6fvab6/HojTvcCF2jsgSsYt0j9WgxiK90GEuC9HtvLCR8NO/sbf
 vOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770342538; x=1770947338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=oFNGO51PMeoKDMXX9HvJxDVXw9M+ZRYt7fQtufyBgpC6F9zhwqyN7DC/BVqFCKoHef
 jkHPNFXzVd6yU6UsIRIaBclNbrEMCaYqTGHz9XiEW7eOzDuDSOPBGt43khR1CsxZJ5sO
 6uxr1k6fydUwvI/4oYshTv0dFxvRW1yKpvcjPh95EinK6nnbkCwOl1vPdA4F1nrEJg34
 7QjSSGdDxyG5mbCK0kb885D7MuL5hse2nynxqiHZLiRHg5e1PC/EOI+kqzGMwDykaAq8
 IoOEhMpSrTksqmPggxG612EUkvMRMEDSUhb4ukv7w5TEfl+cVVoG+DVuGSCCkEVZNsyY
 2xXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW040us+/MDOnv58djr0RKF/aqfdLmlERu4IeFmcgVKSgvFiIk8YBiXCs5RvwYG9D6OTEsItyS/ZyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNCzvZKdu5mCfWgC26BoEpqyAOffzkjt8dSrywOJZBamPL/9Fc
 rIbcBh8ggKJka8IycSn0f1A9wbT3bKmRzykZUZsAxsi0FA93zl2PFthWkiFpa5UBxWDDN48743s
 lRKt56kGXoEC1CFkhegLH8zdteTn3Bnw=
X-Gm-Gg: AZuq6aKGXqnlhOJZ74VmZ/bkI7okg6NRHOnd4MbZ7FBZtX0d4gUV/SsIy3PA5dbDHiC
 bvJmMu4FqnkX69Jiz2/DOdKS1T2xMbqmSUdwuqAknmloOdCe+sQd11XVzL+ltgHoRHWdTC/hEGu
 A0ZnwqmgzjDUb73svh5o12S5+18gRpyJYXLSM1Yid9Inie1spcXlllL95KqCRY1ASxTHFfBK1eX
 sEDJcEpxMmWR6/RzRGL+k2+VsMNxqilC9EfCaPxEBSTEBIaJvwL6MXtWjY8cj+f0n8O5ZonRpRH
 GbnUqOTDupKm+Epeaqll81gpnjNK5kaUkdl27mVAblWMbdW0Qy6496c=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
 <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
