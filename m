Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5F606A31B
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2026 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPVdzA3p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAE910E302;
	Fri,  6 Nov 2026 05:08:15 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913710E302
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2026 05:08:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-5364042eecfso3085021cf.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2026 21:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941688; cv=none;
 d=google.com; s=arc-20260327;
 b=neL9WKgxNWcnXk9oPCxfxQrpIWfY0GMYVKwLxLKGkVJtSq+zVMsaJoWFUf+Qbo4xvN
 c45SBsL+Nuwwyo2CNWdw8vIHtXqKftOBAbZnh69DiXJxler03iqrQu8zVeMnVYgh43HY
 AxzlrHfvgftEn8B3GO2gTYfPVNSqE/HMd1hCbhY9sC2kk4yM+DNgYnL7Ol/CrbbeC9w9
 GEAdTf8SbfGVzIKB5B/YyGvSkhhRRarJsATQeqKCjrF9fftMJRI/h70aaEqGKElZNs4H
 GaIzQAPBxfOYsavY9pjbWaCqQuXwiXrJE9csRuxY4OSmqiNFYYNgyvp7CMMUZG2AkZJu
 zaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 fh=SFEWLXyHLR+Yd0SmfDKw5NIsQrmC6JW0krrNcsfkbVg=;
 b=NFMRPuzib0Zh/DX2msgOmtHC1m/aN0RnlTJdD5EIfSz+btEZnwR2HOyKVCciShTd/5
 yXsYFqzWnS3jL6lntF8C1BjEd55qxe0a9iKYb+pHoRjcYhfO/WoWkZJDW8uHWHH/krCS
 gT8iy6hw9HWYCqrBC82P25XWSkCQNj5J+CgJyzz/DHH1r4RD5U1eqEeWgthGaAAtR0bH
 4P3Roco+Dr2tOTGJvzgdu0MKzMMt0tExPOJ8E5uCoMbIQDa69fptatLTKlnL5KCtmFQk
 r7//NqD357oytALJB6rwd67OUdypixfcl0/x50cXmDYbQtMO7GiufjUIJBNHR3wbiram
 mKOw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793941688; x=1794546488; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 b=SPVdzA3pVp+q3ITJ1Oi5/tuLEOFGYaoge9/koXWmuhA0cjWdaLOvU/3VXtNL+G1cdh
 WaOiEBfLVcmfNZCgKa0uKWlkFAaug3fuTLgvZ3noqk3QeEahjsInCIqvbZDgNBTsZU21
 UW0s8gCTK6RbqkPDtv7HCiUca2CvqnHJoGrkrXlwULJdTwYVrR0F7iNJ2B/2VymMf3oT
 qrPFhbRfAzSoIe2ER076txBePAKq/LvbsT79oCaYzckBzjpd94tywYiJjA8SluTNaWZj
 EeZAfXbXgF8AayS3tWFTWhRFuma8kdFmqDtvceHX3vEL1Pff4UFM9n8lwpsLJBcNuDK4
 UXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793941688; x=1794546488;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 b=r439wCcqLiMs2OIgh5DZ8IjdgBJ5fauL6vKnKaiTDGLz9ELvWyl8wAc+LMOZ0VcCUR
 ++kejUkpt9hUwKrceGBvLi1dDNQMnScvOh2PuOJ/QGCF2eKVwOHo2cBpcSo4i1NH9ihd
 3x9fYxjD8d3uxUAxDAVhuHpTrt1yB6yC72LBMsXvFEsqXnXiLyrZrdnFuBrFQDY9K/DI
 01ZNlm+EMtIPP+PyclCL4qsNzR/esZKMU61r+fRw8CbBrq3AGDGCKcMio3UoyTL/D3vK
 Ghi6UnKxXZQI8eGW/giVSzzwQ+gOzgcmaThYQRZyo5FNvcfb3BpWM02uCfEPUdT0OeGK
 8DjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7RWsCRvvilntqbhVemBUycSmIqx4cxOMBZ0YBdvKUgXmTNXiNcX5GEhJWXU8B/N6A7zawXsSEG2k=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8ozx/arLV6YVukoHpQ2usnTOFWvEhx8idNfb1aVM/FPyB+OxM9
 bhVKuGDeLEuRwMLqJsHEImkjYYvc/tdIQz8631YIgKGuCXrgUWHghnngyFK/K56lcKE9iACxuic
 HlK/5dw0JvKeZYXTJVltGcAkWiQAyvDA=
X-Gm-Gg: AYBFou1P3N/+E+sIce9EihllR7k2TO4l3u2MeADpEoyyhUvsXLt0iaFovCwOuhx1iXL
 FN70GVGjHFaCg6LmagSyXrW+O3LkAdolZtYcxr2FCmm4zoKFTK/LrIgOmmk3RCgGFm4NBiJVMEC
 Dj+meP3hTsT0JYqc+af2N9d38ARJLPZqmzQUj02SlTftxeQKwHYHDNK8uGnp1vDldHzl3yXjqBi
 8Ez6iRuJTnXKoGwZzOWKhdAKEWHKtRM6j7Gz1XYQiaNicndW+X9KuZxwskgCiq4sUS7YkaphXzM
 +hnVIW84rIrlRlKUpJEeL/7Zqr9U6cTWCd9bN3K1gnqlgKxRUNWRa+T0h1lxybJj7MhaC22WAl2
 S34lm6UtvjGNYrrz+XY9UB4ycHHvT8zEO6DMDYv+/FK+loBxKkiUB6XbT+d2/KgYSAqpKilOAeL
 eZSKOKCYkLXTjEIDzlDELp9w==
X-Received: by 2002:a05:622a:114b:b0:54d:6b3a:d22f with SMTP id
 d75a77b69052e-54e1309deb9mr23285741cf.22.1793941683728; Thu, 05 Nov 2026
 21:08:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <au06WTroGBQ/Gqbt@gsse-cloud1.jf.intel.com>
 <au09iOI78yeru3BK@gsse-cloud1.jf.intel.com>
In-Reply-To: <au09iOI78yeru3BK@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Nov 2026 15:07:51 +1000
X-Gm-Features: AclHuK-Tzf2viDf_stMcddnJZaRm6-IN9felbic9bp3B876AGg3rzgiWvizNEeY
Message-ID: <CAPM=9twYRmFoaibBZQA2+-qRe=dTc8z9fC0WjgudM=HD+QzDGQ@mail.gmail.com>
Subject: Re: [PULL] drm-xe-fixes
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>
> I'm not sure why patches below bac6deafcd2b are in this PR?
>
> I did have to force-push drm-xe-fixes today, likewise had to force the
> PR generation as patches which were not Xe's complained about a missing
> SoB.
>
> Not sure what is going here. If you need to drop this PR, I can sync
> with my fellow Intel maintainers and try again after rc2. Again apologie.
>

Something is very messed up, you don't have v7.4-rc1 so it seems like
somebody rebased back too far and screwed up the tree history.

Please rebase onto Linus v7.4-rc1 tag

commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4 (tag: v7.4-rc1)

In your tree

commit 8f26dd9c8361a9428cad2ffa40bad672577be6c6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Commit: Matthew Brost <matthew.brost@intel.com>

    Linux 7.4-rc1

Something went wrong in a rebase land, force pushing was probably not
the right answer.

Dave.
