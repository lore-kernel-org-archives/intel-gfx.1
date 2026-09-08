Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24680C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 15:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6C610EC8C;
	Tue,  8 Sep 2026 15:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nnqlzLgD";
	dkim-atps=neutral
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com
 [74.125.228.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8B10EC8D
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 15:15:49 +0000 (UTC)
Received: by mail-pz2-f12.google.com with SMTP id
 41be03b00d2f7-cc1ab17a810so183570a12.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 08 Sep 2026 08:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880549; cv=none;
 d=google.com; s=arc-20260327;
 b=kXn0I7KiJTEb75tc+13sJygzibX0hY3doiqGIeOb5/VtzcWg+9OF51H+ady/s3J2Lx
 xvYS8n0r3eM5cjyMbHB5GvpvztxlWCLopokLvnSHh88TQY6jeAHuhMxlLE6aqPNGudKZ
 Y0fyPQ3fiA7uYsyHN5+F798HwG+jPEkSdNPpMoKh0WWy9ujaWgD6rCVircyVd49auVqp
 nShcydtVX3H3cjs75GQURrjskW/Iy6FJqjFpZj9DS/roXdxaUN1kXwG7NasMeBFITKBx
 H1qTp0FiLmeSvslxOmfAVJk3rNxbu/4R1m5+p9KwbNpzln4EhTsQyw49Ec+qULvrkcn3
 Qtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
 fh=HvjRoSc83+KYaUKn1sm6fkUlPA5BMaNblzfrmj2ojxw=;
 b=A3rv3cNDXC8uudV36u7Cij9AAS7SuloaOaUrvseyVwzfu8tzC42PHf7RKdMNBI2eRU
 pI/G1mGbzVCOj3rwsBEqIEu0/TcPHVQaRAFK9NsEnkb632ycw++Yc6RV8Ej8xlo3+aaS
 J18XSZrzGmfvychtAJ2XPGebwsMShro8Z3uzKm9EKkbkRAOFNLu3/AYokzol2ARG2Tbc
 zk9saiUCPY9wExS0lgIWsD8rG5hFl03CJ7Thu6SbW9m35HKdadCwAYlTZZ02J3brEC+2
 U7/JHbqMqwLW+V9zbgs+SAXMRPD/4b9qtoiC/dcP1/Sgz6AXlIsi3ohXW7Pmt/XMrKns
 kBtg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788880549; x=1789485349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
 b=nnqlzLgD9SjelP3hoxqoMhP9omORu3KQXiKGr1wKJoVzOFfHzoo38nxHtV5aQ+smJV
 tOFguYiqSnI1U5jwggyMJVT34pU65DyA3ZLB9jYfiaWCLJMFA7jd10QYLumTszyE7Gdf
 JdiWVbfggU+S5yASECkpgF9rRVemr6Q5MLGbmeCA8QvloFOlSiP4if6sxpr3w/b0R+32
 7ZG0/3Ap/6TFds+lMOmZszYTVdfGkaChhJGV+peafCXCbcrSpoMyForS5h+i9AaEIUQ2
 s7pFCs1eCu7hxCWCj4Xz/bScmFpLt6SyJF+SD4aJAjn54seERpkTFv8OGAH8dXxX08mv
 6bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788880549; x=1789485349;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
 b=sa/5sr/lutQz6y8TqsEL0Yc+O5p561cwU5WdYRfWjcdGObM5nqwCT0aVpj3oxcXFsB
 hNX9hmH6REYhEGR8sT0J2B5oT/L+yBw2ibtFXiYLq/uYAXRcORGAGuwfBMIhLGXTx2OU
 4yx4FYOPzk9cmc8KGfT7RroFxEuTaSlrJWcFUhEguDLgftNP9PiWiANllueg7B+mvQqM
 BypXdx2XbTdY1RsHAXW2y4t60XvE9BztsrMoqoD8Ydm+klFCeiNY2d3Fo2ZJGbwCIJoT
 H+xgwEcmikVQhdQT2hpG69X+hPZ+0+GNt0bh9195jyk2KwYlyQ2ftV7tBQ+nHExgukiV
 bTYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1qpzY+veDm7jEV5GD4bfUBAZGTKtsV37agz+nhFsr9v0gkSQuDPMp9NfUVdbbwxl0OBN7TcGrDas=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lj20nSrojiBsCqbzy/DkcZYH4AHj9oVSkpWHj8m2MBPoYosC4j
 05cSV9hLdkT8uPub4KjfnCCH6BiaPkRkaZO8VIdq4SarGC6Q8joWo3KWbiRhGYeclsGAYL1d0oB
 2ILG1+8jprQAxKKO5NXfMeQd7h/Kl47Y=
X-Gm-Gg: AYBFou2qPUhrFz6nWYkWz2DtVuc4xXvMg897LUxlQP68qqfXojCHUacMuKAkJDCJjt5
 2fHB5LwJjVDWbWO2ywi8tHc07SyQaXqVb3zAg0PZD4ML/tWdZ1kB1vlDd50/VBVjEj6luutXVEn
 rRVnYn7vg3UBJVmzgCllJV98dTHwwg8ZuaUMIXj6ZdQqWOVzLZGJmPG2r4z19NSBRPPtJ5ZbDz7
 kBRjQ8RBBuJZlDWCIXE/GVEK7CKVh2LZ9LhFihgElgAwqgov11VoKjjMT0qthLgWj6qQ4ZYRVQx
 81sQSD9ARgEc4tzxK/W0uy0QC/SWEdlaR51j2HxGCHnQLp7nZaSIAlH8CyNwrAaziSuDbaCoTzQ
 3Rv+xB4h77R2PEERht0YgBTQOP1FEL8A=
X-Received: by 2002:a17:90b:2dc5:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39b9a99459fmr4622408a91.3.1788880548969; Tue, 08 Sep 2026
 08:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <aqAVSgsypMch2c0v@sirena.org.uk>
 <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
In-Reply-To: <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 11:15:36 -0400
X-Gm-Features: AcwNN1VnTXeV8V659QiKMCwYI-2o7Ug_RreQwrzcUErxFzh7ylh_yBH27lIHOHY
Message-ID: <CADnq5_MiNmzkDqZRk70_RmJaJWTEXFtu0c+eV3TJ_At=uvJ54Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, 
 Alex Huang <Alex.Huang2@amd.com>, Mario Limonciello <superm1@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 8, 2026 at 10:07=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 08, 2026 at 03:01:50PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/a=
mdgpu_dm_connector_test.ko: symbol 'parse_hdmi_amd_vsdb' undefined!
> >
> > Caused by commit
> >
> >    65198b3d0738 (drm/amd/display: Use HDMI FreeSync range from common E=
DID parser)
>
> Sorry, that should be f65198b3d07389afdcb48e4ad00fea2aded95dfd.
>
> > I have continued to use the version from next-20260831 instead.
>

Fixed here:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/730c6d8072d8d9a6dbf=
d06c7c5ab4479167a792a

Alex
