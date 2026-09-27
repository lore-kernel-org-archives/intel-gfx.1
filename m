Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DEBC9832F
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2026 17:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C111A10E0AE;
	Sun, 27 Sep 2026 17:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="Qk3FG4t2";
	dkim-atps=neutral
Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com
 [74.125.231.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2EA10E4A5
 for <intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2026 17:34:09 +0000 (UTC)
Received: by mail-oo2-f43.google.com with SMTP id
 46e09a7af769-81b36a8d5b5so504218a34.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2026 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1790530448; x=1791135248;
 darn=lists.freedesktop.org; 
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:content-type:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MuL0v1f3+J9yyQw0yqK0TvcdFgWSs593LTmvyHRza0g=;
 b=Qk3FG4t2NHLM2wOnlf2THwx7wwpnjO52mlNURVE5IbLMMc51KGb0K90+xmSOKMKu1+
 wQb4ePI1yzNqqgcejfwPaouIMzHE/nGqBaELGR/Sf3D9fwZWLjs4Han+ZUCC6RbyXPJG
 sn0tHrvf/uUkUJ9K2S4Odo9kF0WuItCnVGQvunjfqmqKjktRkpdf79Mxc7RIAreAdgMS
 3Of8Gktm9I0p/BfnblzsIsiIkp1Ymgcp8d3P5EMO0iiuqu/iZ2dAHrl/zU1DsH/Whs1+
 RyfPBDSwULTcoM8eNDRHSBggLh5EXoSIbJNIxJg0OYz8iN7Nz8uef6uUt+qX6ZEgxLAv
 DpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790530448; x=1791135248;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MuL0v1f3+J9yyQw0yqK0TvcdFgWSs593LTmvyHRza0g=;
 b=fcz63UnIkdlWqOgtbdMcDgleqretJmWK2IOMVAGkXW56MXwBdUH90nEH6PhPboLhy2
 DUDubhC8yUm1YOrm3TnkUuDKfT/qLPMavf2gSuqfkDv+orY8Ja+m2nPfJNr31+wS0MbS
 FeHfbo7q9PFFLMF1lKHC8dNeojohlhDWYvCVRHAKM+/rIlEjnNCP/CJo1OnHd3WSfKUI
 36naT8WTz5dz6bDD8LhjsW2dBsEyGp8VOWfi/3uHOFPkl934fFlKkOIWiLDaZ3vROuqC
 82tDsrfxtP8fZ+sktbW1Pq44dji7ipQwQ2J1i3Z5HVsR7g6UBlewVR88NOcmZuIsfi06
 jQqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmLuVd+bflVUATS0el5cgzfRc5Iv1vacjfPJYkv5uh/DnHoyUXmVC37ttnVoahJV31qr05/r3eRSw=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kDvtNPOfKr7Rq0gJpABr6/IgzdV95/b9uVQeJ2kunFLo+7fAGm
 zXH0XvjaeTsmUyTaebKCFFiYj6e9a9GA+Ywn262u74aQ7T2QdqwyBVh9owpJH+o/NA==
X-Gm-Gg: AYBFou0idBIp5qV00TbvcOAOnHkEc/CdwOgyWgiB0fVq3QilX64pVPEvSSIsHSwWSTv
 9s7RQMLS4KMo5xQ0p5bL4tfrVDEMMkLOgAb1HGZVxMRa5Kf89aOQETkCDDS6aMLPke/eZ/r9d/U
 hLlciBYfI8Inkb6kndvwlRjGYcAoVYc8AWxrrQVrAtEjcc3Zi0zVrokEb4j88ap4qg0uApjJKoH
 W3rqnEqYBXyHMyDs+O9nDM5fnfmofZl0a6g5Vijs55a9TKwDdPA3k69ndLjLL9fU3l2+q0akTjG
 WU+ijIn5d0q2mfztlSs/B4JyItDeU+aYPWPXcadqNAg0m4IY+spd/uhgrgLhczTGQiutXEPAiBx
 sLi+MNyS3c0FRS4aa9smEyB4oGfvfVyVUvyU/YLmU1ATylXu2CJ5ssz1vNYlqVoBc7NjoRVQj7Y
 7usQxZSiNz7a8IFNyokyKl6JeMRsu8HHBDn9US0k97jLNdMkCrhv+t836rDB6vrQoWf5OqFo8OM
 GkTwaNoq63PlZ1w/ecU1qPnbTCH/A==
X-Received: by 2002:a05:6820:820:b0:6cd:3ffc:64d2 with SMTP id
 006d021491bc7-6d5bac3e146mr7371645eaf.77.1790530448403; 
 Sun, 27 Sep 2026 10:34:08 -0700 (PDT)
Received: from smtpclient.apple ([2600:381:5ba1:a8b2:19d5:7f67:de2b:c3a5])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6d883394af1sm2755239eaf.13.2026.09.27.10.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 10:34:06 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Date: Sun, 27 Sep 2026 10:33:53 -0700
Message-Id: <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Yosry Ahmed <yosry@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rafael J Wysocki <rafael@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org,
 Matthias Goergens <matthias.goergens@gmail.com>
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
X-Mailer: iPhone Mail (23G90)
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



> On Sep 25, 2026, at 9:55=E2=80=AFPM, Matthias Goergens <matthias.goergens@=
gmail.com> wrote:
>=20
> =EF=BB=BFThis RFC adds offload-only swap areas for deliberate cold-page of=
fload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.

This seems unnecessarily annoying to configure. It seems to me that you=E2=80=
=99re creating a bizarrely named administrative flag that means, roughly, =E2=
=80=9Cswapping to this location may allocate memory=E2=80=9D.  Why can=E2=80=
=99t the kernel figure this out itself?


For that matter, how well does this even work in practice?  If I configure t=
wo swap devices, one =E2=80=9Coffload-only=E2=80=9D and one conventional, it=
 seems like the relative fullness of the devices will be mostly an accident o=
f what triggers swap as the system is running. If the conventional swap fill=
s up, is there a means to proactively empty it?  Under OOM conditions, will a=
nything preferentially kill tasks that reference memory in conventional swap=
?

Is the locking and recursion structure of the mm code such that we won=E2=80=
=99t have deadlocks where cgroup triggers swap to an =E2=80=9Coffload-only=E2=
=80=9D device, which allocates, which causes memory pressure, which then tri=
es to swap more to conventional swap?  (Maybe this works fine.)

For that matter, if the system is under overall memory pressure, why do you c=
are what triggered the particular swap operation that is being processed?



The remainder of the writeup is IMO somewhat incoherent.  To the extent that=
 AI was used, can you read it and make sure it makes sense?

And the first few hundred lines of patch I skimmed seem like incomprehensibl=
e churn.  Adding =E2=80=9Celigible=E2=80=9D to a bunch of calls does nothing=
 to explain what=E2=80=99s going on.

