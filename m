Return-Path: <SRS0=xpeQ=JU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FECC433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Apr 2021 06:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6077461164
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Apr 2021 06:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6077461164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036C96EB43;
	Fri, 23 Apr 2021 06:25:54 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A956EB43;
 Fri, 23 Apr 2021 06:25:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h10so56179345edt.13;
 Thu, 22 Apr 2021 23:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJ0OfejcSKcu5jMSXE+csw5jWV+060M5nxuJF3eMSt4=;
 b=QDT8KfpyL0E1RVf8TusCzRyncN8dpPpglZ1GN81/9b2LmLYic1i5wLKLO5O38Z2vGr
 SlPok3DRmINVQ6LKM6hoTKtriQe7+Gt30vvQMI5Y7JJsBdEauILunmknd42r6GXYMaWS
 aRMW0QQWHHmxYLFgOJ2zm7FC7pCMWN06VPYufh27qlpp7NJ4aaG+AuKfSXHL4nzduFGo
 GMh43By/RKQ1lm2MHllOnhaovzaWRAsrRS1iEFdAbl219nqtbCItiJO7srCGqIywTLqD
 m/MAoe4quSAAZy1RO2fs5H6lbTFdxLJA0rV6J2YtytCleCipnz1/g+wRMBRkS8sDN6gg
 5z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJ0OfejcSKcu5jMSXE+csw5jWV+060M5nxuJF3eMSt4=;
 b=sgigNf7cXGt8kQbJO7SzLLTEIDBQa/N8PSdHKMrq/cCDs5iCPK6jHppe8j2OXOW3kC
 XR6cmMycDZYY0EnjU758GMu4CPY1AHto5sWsPFfNOx0AWVjpamHER+TUpgCwxrTZKGOI
 eZHA5/kuKbdxIKzBNoYCacTjbfKmnPDi8TJ9KmSTPZJcMJHVlU7/mCtsKmJPh/Y4fC+Q
 sEHZBBeYWX5WNOpY5jdXQdhHJADrLnqzGXpp5Oj80ala0bhV6f8y4Eiy2N1MDp9vNPyS
 UvldpieMPFdo/MoLOcHepOcVGqJH5eu4teqQNojbcDkZwzyGW/Ef3XjznFAX6GTHCpnQ
 Go7g==
X-Gm-Message-State: AOAM531iLrYQxEzWvr1ji/W/7NX7CdL9EyluBBpf1JkwiricI98EH/wu
 vAaf4z/8cvD+l/X4WTgJkwgWbZgPvEK0dvdwSzqxDIap
X-Google-Smtp-Source: ABdhPJyFzyyFvl+ap11hNzvZjZZ0V0bj6+t8Lkp50t1gG1OVbKJkA7vIrhBrnHcGWoG8Vx1g6XXOQiTGywfLdqsNtgQ=
X-Received: by 2002:a05:6402:441:: with SMTP id
 p1mr2592204edw.298.1619159151619; 
 Thu, 22 Apr 2021 23:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210419164403.52470-1-matthew.auld@intel.com>
In-Reply-To: <20210419164403.52470-1-matthew.auld@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Apr 2021 16:25:40 +1000
Message-ID: <CAPM=9twy4NetwCmptDTvWZzL7ufC2xZ_nFgLGgXK9JqpmP=C3Q@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4] drm/doc/rfc: i915 DG1 uAPI
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 20 Apr 2021 at 02:45, Matthew Auld <matthew.auld@intel.com> wrote:
>
> Add an entry for the new uAPI needed for DG1. Also add the overall
> upstream plan, including some notes for the TTM conversion.
>
> v2(Daniel):
>   - include the overall upstreaming plan
>   - add a note for mmap, there are differences here for TTM vs i915
>   - bunch of other suggestions from Daniel
> v3:
>  (Daniel)
>   - add a note for set/get caching stuff
>   - add some more docs for existing query and extensions stuff
>   - add an actual code example for regions query
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
>         - try a simpler design with the placements extension
>         - rather than have a generic setparam which can cover multiple
>           use cases, have each extension be responsible for one thing
>           only
> v4:
>  (Daniel)
>   - add some more notes for ttm conversion
>   - bunch of other stuff
>  (Jason)
>   - uAPI change(!):
>         - drop all the extra rsvd members for the region_query and
>           region_info, just keep the bare minimum needed for padding

Staying out of the ioctl's being over engineering, I hope they have a
good future use case.

The plan seems like a good plan.

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
